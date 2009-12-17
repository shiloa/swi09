import os, time, sys
import sqlite3, csv
COMPANIES = []
PLANS = {}
def read_csv(file_path):
    """read plans.csv file and loads it to db"""
    
    if os.path.isfile(file_path):
        d = csv.DictReader(open(file_path, 'r'))
        
        for row in d:
            company = row['company']
            plan = row['plan']
            flat_rate = row['flat_rate']
            
            # add company
            if not company in COMPANIES:
                COMPANIES.append(company)
                
            # add plans
            if not PLANS.get(plan, False):
                PLANS[plan] = { 'steps' : {} } 
                
            # add steps