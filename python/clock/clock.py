class Clock(object):
    def __init__(self, hour, minutes):
        self.__set_hour__(0)
        self.__set_minutes__(0)

        self.add(minutes).add(hour * 60)

    def __eq__(self, other):
        return self.hour == other.hour and self.minutes == other.minutes

    def __str__(self):
        return "%02d:%02d" % (self.hour, self.minutes)

    def __set_hour__(self, hour):
        self.hour = hour % 24

    def __set_minutes__(self, minutes):
        self.minutes = minutes % 60

    def add(self, minutes):
        new_minutes = self.minutes + minutes
        delta_hours = new_minutes / 60 if new_minutes else 0

        new_hour = self.hour + delta_hours

        self.__set_hour__(new_hour)
        self.__set_minutes__(new_minutes)

        return self

    def subtract(self, minutes):
        self.add(minutes * -1)

        return self
