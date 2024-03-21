import configparser

filePath = 'variables/config.ini'


class ConfigReader:

    def read_config_value(self, varname):
        config = configparser.ConfigParser()
        config.read(filePath)
        value = {}
        for section in config.sections():
            value = config.get(section, varname)
        return value