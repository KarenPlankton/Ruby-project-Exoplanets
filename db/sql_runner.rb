require('pg')
require('pp')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'exoplanets', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
      #pp result
    ensure
      db.close() if db != nil
    end
    return result
  end

end
