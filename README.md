# Legislative Data

`Legislative Data` is a data library that collect and organize publicly available government data. It parses csv files into hashes, uses DTO Models to access data dinamically, returns hash mapped objects and display them back into new csv files.

## System information

**Language:** Ruby
**Version:** 3.2.2

## Running up

### Ruby

First, you need to have Ruby installed. For that you can install the version `3.2.2` directly on your machine **or** install the `asdf` [tool version manager](https://asdf-vm.com/guide/introduction.html) and run in your terminal:

```
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.2.2
```

After that, just run `bundle install` and you are ready.

### Tests

```
rspec
```

After running tests it already generates the output files at [output files](files/output/csv/).

## Features

### Legislators Support/Oppose Count

The 'Legislators Support/Oppose Count' feature calculates, for every legislator in the dataset (based on csv files), how many bills did the legislator support and how many bills did the legislator oppose.

Below we have the call and output for a hash example:

```ruby
LegislativeData::Service.new.voted_bills_by_legislators

=>
[
  {
    legislator_id: 904789,
    legislator_name: "Rep. Don Bacon (R-NE-2)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 1603850,
    legislator_name: "Rep. Jamaal Bowman (D-NY-16)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 1852382,
    legislator_name: "Rep. Cori Bush (D-MO-1)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 904796,
    legislator_name: "Rep. Brian Fitzpatrick (R-PA-1)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 15318,
    legislator_name: "Rep. Andrew Garbarino (R-NY-2)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 1269775,
    legislator_name: "Rep. Anthony Gonzalez (R-OH-16)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 412649,
    legislator_name: "Rep. John Katko (R-NY-24)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 412421,
    legislator_name: "Rep. Adam Kinzinger (R-IL-16)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 15367,
    legislator_name: "Rep. Nicole Malliotakis (R-NY-11)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 412487,
    legislator_name: "Rep. David McKinley (R-WV-1)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 1269767,
    legislator_name: "Rep. Alexandria Ocasio-Cortez (D-NY-14)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 905216,
    legislator_name: "Rep. Ilhan Omar (D-MN-5)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 1269778,
    legislator_name: "Rep. Ayanna Pressley (D-MA-7)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 412393,
    legislator_name: "Rep. Tom Reed (R-NY-23)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 400380,
    legislator_name: "Rep. Chris Smith (R-NJ-4)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 1269790,
    legislator_name: "Rep. Rashida Tlaib (D-MI-13)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 400414,
    legislator_name: "Rep. Fred Upton (R-MI-6)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 17941,
    legislator_name: "Rep. Jeff Van Drew (R-NJ-2)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 400440,
    legislator_name: "Rep. Don Young (R-AK-1)",
    supported: 1,
    opposed: 1
  },
  {
    legislator_id: 412211,
    legislator_name: "Rep. John Yarmuth (D-KY-3)",
    supported: 0,
    opposed: 0
  }
]
```

And below we have the call and output for a csv example ([you can also find it at output files](files/output/csv/legislators-support-oppose-count.csv)):

```ruby
LegislativeData.legislators_support_oppose_count
```

```csv
id,name,num_supported_bills,num_opposed_bills
904789,Rep. Don Bacon (R-NE-2),1,1
1603850,Rep. Jamaal Bowman (D-NY-16),1,1
1852382,Rep. Cori Bush (D-MO-1),1,1
904796,Rep. Brian Fitzpatrick (R-PA-1),1,1
15318,Rep. Andrew Garbarino (R-NY-2),1,1
1269775,Rep. Anthony Gonzalez (R-OH-16),1,1
412649,Rep. John Katko (R-NY-24),1,1
412421,Rep. Adam Kinzinger (R-IL-16),1,1
15367,Rep. Nicole Malliotakis (R-NY-11),1,1
412487,Rep. David McKinley (R-WV-1),1,1
1269767,Rep. Alexandria Ocasio-Cortez (D-NY-14),1,1
905216,Rep. Ilhan Omar (D-MN-5),1,1
1269778,Rep. Ayanna Pressley (D-MA-7),1,1
412393,Rep. Tom Reed (R-NY-23),1,1
400380,Rep. Chris Smith (R-NJ-4),1,1
1269790,Rep. Rashida Tlaib (D-MI-13),1,1
400414,Rep. Fred Upton (R-MI-6),1,1
17941,Rep. Jeff Van Drew (R-NJ-2),1,1
400440,Rep. Don Young (R-AK-1),1,1
412211,Rep. John Yarmuth (D-KY-3),0,0
```

### Bills Support/Oppose Count

The 'Bills Support/Oppose Count' feature calculates, for every bill in the dataset (based on csv files), how many legislators did support bill and how many bills did oppose the bill.

Below we have the call and output for a hash example:

```ruby
LegislativeData::Service.new.bills_support

=>
[
  {
    bill_id: 2952375,
    bill_title: "H.R. 5376: Build Back Better Act",
    principal_sponsor: "Rep. John Yarmuth (D-KY-3)",
    supporters: [
      "Rep. Rashida Tlaib (D-MI-13)",
      "Rep. Ayanna Pressley (D-MA-7)",
      "Rep. Ilhan Omar (D-MN-5)",
      "Rep. Alexandria Ocasio-Cortez (D-NY-14)",
      "Rep. Cori Bush (D-MO-1)",
      "Rep. Jamaal Bowman (D-NY-16)"
    ],
    opposers: [
      "Rep. Don Young (R-AK-1)",
      "Rep. Jeff Van Drew (R-NJ-2)",
      "Rep. Fred Upton (R-MI-6)",
      "Rep. Chris Smith (R-NJ-4)",
      "Rep. Tom Reed (R-NY-23)",
      "Rep. David McKinley (R-WV-1)",
      "Rep. Nicole Malliotakis (R-NY-11)",
      "Rep. Adam Kinzinger (R-IL-16)",
      "Rep. John Katko (R-NY-24)",
      "Rep. Anthony Gonzalez (R-OH-16)",
      "Rep. Andrew Garbarino (R-NY-2)",
      "Rep. Brian Fitzpatrick (R-PA-1)",
      "Rep. Don Bacon (R-NE-2)"
    ]
  },
  {
    bill_id: 2900994,
    bill_title: "H.R. 3684: Infrastructure Investment and Jobs Act",
    principal_sponsor: nil,
    supporters: [
      "Rep. Don Young (R-AK-1)",
      "Rep. Jeff Van Drew (R-NJ-2)",
      "Rep. Fred Upton (R-MI-6)",
      "Rep. Chris Smith (R-NJ-4)",
      "Rep. Tom Reed (R-NY-23)",
      "Rep. David McKinley (R-WV-1)",
      "Rep. Nicole Malliotakis (R-NY-11)",
      "Rep. Adam Kinzinger (R-IL-16)",
      "Rep. John Katko (R-NY-24)",
      "Rep. Anthony Gonzalez (R-OH-16)",
      "Rep. Andrew Garbarino (R-NY-2)",
      "Rep. Brian Fitzpatrick (R-PA-1)",
      "Rep. Don Bacon (R-NE-2)"
    ],
    opposers: [
      "Rep. Rashida Tlaib (D-MI-13)",
      "Rep. Ayanna Pressley (D-MA-7)",
      "Rep. Ilhan Omar (D-MN-5)",
      "Rep. Alexandria Ocasio-Cortez (D-NY-14)",
      "Rep. Cori Bush (D-MO-1)",
      "Rep. Jamaal Bowman (D-NY-16)"
    ]
  }
]
```

And below we have the call and output for a csv example ([you can also find it at output files](files/output/csv/bills.csv)):

```ruby
LegislativeData.bills
```

```csv
id,title,supporter_count,opposer_count,primary_sponsor
2952375,H.R. 5376: Build Back Better Act,6,13,Rep. John Yarmuth (D-KY-3)
2900994,H.R. 3684: Infrastructure Investment and Jobs Act,13,6,Unknown

```
