from faker import Faker

class Table:
    def __init__(self, name:str, columns:list, values:list, id_key:str="", id_value:str=""):

        self.name = name
        self.id_key = self.set_id_key(id_key)
        self.id_value = self.set_id_value(id_value)
        self.columns = columns
        self.values = values

    def set_id_key(self, id_key):
        return id_key if id_key != "" else f"{self.name}_id"

    def set_id_value(self, id_value):
        return id_value if id_value != "" else f"{self.name}_id"
        

def main():
    RECORDS = 50
    fake = Faker()

    beneficiario_info = {
        "columns": [
            "nombre",
            "apellido_paterno",
            "apellido_materno",
        ],
        "values": [
            f"'{fake.name()}'",
            f"'{fake.last_name()}'",
            f"'{fake.last_name()}'",
        ]
    }
    beneficiario = Table("beneficiario", beneficiario_info["columns"], beneficiario_info["values"])
    build_sql(RECORDS, beneficiario)

def list_to_string(l):
    delimiter = ", "
    string = [str(element) for element in l]
    return delimiter.join(string)

def build_sql(records, table:Table):
    # Constantes
    PATH = './test.sql'
    result = []

    for i in range(records):
        # Campos
        sql = f"INSERT INTO {table.name} ({table.id_key}, {list_to_string(table.columns)}) VALUES ({table.id_value}, {list_to_string(table.values)});"

        result.append(sql)

    # write SQL statements to file in /tmp directory
    with open(PATH, 'w') as f:
        for i, sql in enumerate(result):
            f.write(sql + '\n')
            print('Inserted record {} of 100'.format(i + 1))

main()

