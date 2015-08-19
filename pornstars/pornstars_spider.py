#!/usr/bin/python

#List of Porn star names at: http://www.ranker.com/list/top-20-pornstars-_female_/ratamatata?page=2

import scrapy

class PornStarSpider(scrapy.Spider):
    name = 'pornstars'
    allowed_domains = ['http://www.ranker.com']
    start_urls = [
        'http://www.ranker.com/list/top-20-pornstars-_female_/ratamatata?page=2',
        'http://www.ranker.com/list/top-20-pornstars-_female_/ratamatata?page=3',
        'http://www.ranker.com/list/top-20-pornstars-_female_/ratamatata?page=4'
    ]
    #goes to page 11, total 528 currently

    def parse(self, response):
        count = 0 
        for foo in response.xpath('//span[@class="inlineBlock oNode"]'):#.extract():
            #yield {'name': foo}
            name = foo.xpath('text()').extract()
            print name
            count += 1

        print('total:', count)
            



    #<span class="inlineBlock oNode" itemprop="name"> Angela Aspen</span>
