class Enviroment < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'オフライン' },
    { id: 3, name: 'オンライン' }
  ]
end
