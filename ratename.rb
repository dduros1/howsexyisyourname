# Script to rank name sexiness

#TODO write something to auto generate the name list
#Current source: https://en.wikipedia.org/wiki/List_of_pornographic_actresses_by_decade

#if ARGV.size < 1
#    puts 'How can I tell you if your name is sexy if you don\'t give me one??'
#    exit
#end


require 'similarity'

corpus = Corpus.new

psnames = File.readlines('psnamelist.txt').each {|l| l.chomp!.downcase!};

#want to do doc similarity based on characters, not just names (don't have enough name data)






$alphabet = [*('a'..'z')]
$pscounts = [0]*$alphabet.size
$firstnames = []


#TODO this is kinda c-ish
#sums character ocurrences and returns them in the same array it was passed
def count_letters (name, counts)
    sum = 0
    $alphabet.each_with_index { |val, index| counts[index] += name.count(val) }
    counts
end

#calculates the score for a given name
def calc_score(name)
    
    count = [0]*$alphabet.size
    count_letters(name, count)

    score = count.each_with_index {|val, idx| puts count[idx] *= $pscounts[idx]}.inject(:+)
    puts "score: #{score}"
    score = score / (name.size - name.count(' '))
    score *= 2 if $firstnames.include? name.downcase.split(' ').first

    score
end

def normalize_counts
    total_letters = $pscounts.inject{|sum, x| sum+=x}
    $pscounts.map! {|x| x = x.to_f/total_letters}
end

#yourname = ARGV.first.downcase
yourname = 'Diane Hosfelt'.downcase!


psnames = File.readlines('psnamelist.txt').each {|l| l.chomp!.downcase!};
psnames.each do |l| 
    $firstnames << l.split(' ').first
end


psnames.each { |name| count_letters(name, $pscounts)}
   
yourscore = calc_score(yourname)




#Use their name in a random number generator


