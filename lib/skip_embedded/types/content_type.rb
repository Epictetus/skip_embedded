# SKIP(Social Knowledge & Innovation Platform)
# Copyright (C) 2008-2009 TIS Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

module SkipEmbedded
  module Types::ContentType
    CONTENT_TYPE_IMAGES = {
      :jpg  => 'image/jpg,image/jpeg,image/pjpeg',
      :jpeg => 'image/jpg,image/jpeg,image/pjpeg',
      :png  => 'image/png,image/x-png',
      :gif  => 'image/gif',
      :bmp  => 'image/bmp'
    }.freeze

    DEFAULT_CONTENT_TYPE = "application/octet-stream"
  end
end
