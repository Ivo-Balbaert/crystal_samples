# Calculate the gravitational acceleration gravAcc:
gc = 6.67e-11                                                  # gravitational constant in m3/kg s2
massEarth = 5.98e24                                            # in kg
radiusEarth = 6378.1                                           # in km
gravAcc = gc * massEarth * 10e-7 / (radiusEarth * radiusEarth) # 9.804927114935673 m/s2
puts gravAcc                                                   # => 9.8049271149356727
