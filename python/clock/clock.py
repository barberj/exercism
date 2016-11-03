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
        print("I am %s and adding %d" % (self, minutes))

        new_minutes = self.minutes + minutes
        delta_hours = new_minutes / 60
        multiplier = 0 if not new_minutes else 1
        print("delta_hours=%d new_minutes=%d minutes=%d" % (
            delta_hours, new_minutes, minutes
        ))
        hours = self.hour + (delta_hours * multiplier)
        print("I am setting %d hours" % hours)
        minutes = new_minutes % 60
        print("I am setting %d minutes" % minutes)

        self.__set_hour__(hours)
        self.__set_minutes__(minutes)

        print("I am now %s" % self)

        return self

    def subtract(self, minutes):
        self.add(minutes * -1)

        return self
