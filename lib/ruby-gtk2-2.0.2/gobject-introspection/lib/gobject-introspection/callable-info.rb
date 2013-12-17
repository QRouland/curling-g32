# Copyright (C) 2013  Ruby-GNOME2 Project Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require "gobject-introspection/collection-reader"

module GObjectIntrospection
  class CallableInfo
    extend CollectionReader

    collection_reader("args")

    def in_args
      callback_indexes = []
      closure_indexes = []
      destroy_indexes = []
      args.each_with_index do |arg, i|
        next if arg.scope == ScopeType::INVALID
        callback_indexes << i
        closure_index = arg.closure
        closure_indexes << closure_index if closure_index != -1
        destroy_index = arg.destroy
        destroy_indexes << destroy_index if destroy_index != -1
      end

      args.find_all.with_index do |arg, i|
        case arg.direction
        when Direction::IN, Direction::INOUT
          if callback_indexes.include?(i)
            false
          elsif closure_indexes.include?(i)
            false
          elsif destroy_indexes.include?(i)
            false
          else
            true
          end
        else
          false
        end
      end
    end

    def required_in_args
      in_args.reject do |arg|
        arg.may_be_null?
      end
    end

    def n_in_args
      in_args.size
    end

    def n_required_in_args
      required_in_args.size
    end

    def require_callback?
      args.any? do |arg|
        arg.direction == Direction::IN and arg.scope != ScopeType::INVALID
      end
    end

    def out_args
      args.find_all do |arg|
        case arg.direction
        when Direction::OUT, Direction::INOUT
          true
        else
          false
        end
      end
    end

    def n_out_args
      out_args.size
    end
  end
end
