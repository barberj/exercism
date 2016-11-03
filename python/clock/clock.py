class Clock(object):
    def __init__(self, hour, minutes):
        self.__set_hour__(hour)
        self.__set_minutes__(minutes)

    def __str__(self):
        return "%02d:%02d" % (self.hour, self.minutes)

    def __set_hour__(self, hour):
        self.hour = hour % 24

    def __set_minutes__(self, minutes):
        self.minutes = minutes % 60

    def add(self, minutes):
        if minutes > 0:
            total_minutes = self.minutes + minutes
            self.__set_hour__(self.hour + (total_minutes / 60))
            self.__set_minutes__(total_minutes)
        #elif minutes < 0:
        #    self.subtract(minutes * -1)

        return self

    def subtract(self, minutes):
        #if minutes > 0:
        #    self.__set_hour__(self.hour - (minutes / 60))
        #    self.__set_minutes__(self.minutes - (minutes % 60))
        #elif minutes < 0:
        #    self.add(minutes * -1)

        return self
