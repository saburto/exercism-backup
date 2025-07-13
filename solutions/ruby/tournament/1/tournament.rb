# frozen_string_literal: true

# Solution for Tournament exercism
class Tournament
  def self.tally(input)
    lines = input.split("\n")
    matches = lines.map { |m| Match.new(m) }

    teams = matches.flat_map(&:to_team_stats)

    aggregated = TeamStatsAggregated.new(teams)

    TallyReporter.new.report(aggregated)
  end

  # Data of matches
  class Match
    LOCAL_TEAM_INDEX = 0
    VISIT_TEAM_INDEX = 1
    RESULT_INDEX = 2
    def initialize(match_raw)
      raw = match_raw.split(';')
      @local = raw[LOCAL_TEAM_INDEX]
      @visit = raw[VISIT_TEAM_INDEX]
      @result = raw[RESULT_INDEX].to_sym
    end

    def to_team_stats
      case @result
      when :draw
        [TeamStats.draw(@local), TeamStats.draw(@visit)]
      when :win
        [TeamStats.win(@local), TeamStats.loss(@visit)]
      when :loss
        [TeamStats.loss(@local), TeamStats.win(@visit)]
      else
        raise 'Something is wrong'
      end
    end
  end

  # Data of teams stats
  class TeamStats
    WINING_POINTS = 3
    DRAW_POINTS = 1

    attr_reader :name, :points, :matches, :win, :draw, :loss

    def initialize(team_name, points, matches, win: 0, draw: 0, loss: 0)
      @name = team_name
      @points = points
      @matches = matches
      @win = win
      @draw = draw
      @loss = loss
    end

    def plus(other)
      TeamStats.new(other.name, other.points + @points, other.matches + @matches,
                    win: other.win + @win,
                    draw: other.draw + @draw,
                    loss: other.loss + @loss)
    end

    def self.draw(team)
      TeamStats.new(team, DRAW_POINTS, 1, draw: 1)
    end

    def self.win(team)
      TeamStats.new(team, WINING_POINTS, 1, win: 1)
    end

    def self.loss(team)
      TeamStats.new(team, 0, 1, loss: 1)
    end

    def self.zero(team)
      TeamStats.new(team, 0, 0)
    end
  end

  # Calculation to group and sum Team stats
  class TeamStatsAggregated
    attr_reader :table

    def initialize(teams_stats)
      @table = teams_stats.group_by(&:name)
                          .map { |key, value| aggregate(key, value) }
                          .sort_by { |t| [t.points * -1, t.name] }
    end

    private

    def aggregate(name, teams_stats)
      teams_stats.reduce(TeamStats.zero(name)) { |acc, team_statd| acc.plus(team_statd) }
    end
  end

  # Take team stats to the expected text report
  class TallyReporter
    NAME_LENGTH = 30
    STATS_LENGTH = 2
    SEPARATOR = ' | '
    LAST_LINE = ''
    LINE_SEPARATOR = "\n"

    def report(aggregated)
      teams = aggregated.table.map do |team|
        [format_name(team.name), *format_stats(team)].join(SEPARATOR)
      end

      [head, *teams, LAST_LINE].join(LINE_SEPARATOR)
    end

    private

    def head
      name_header = format_name('Team')
      stats_header = %w[MP W D L P].map { |h| h.rjust(STATS_LENGTH) }

      [name_header, *stats_header].join(SEPARATOR)
    end

    def format_stats(team)
      [team.matches, team.win, team.draw, team.loss, team.points].map { |s| s.to_s.rjust(2) }
    end

    def format_name(name)
      name.ljust(NAME_LENGTH)
    end
  end
end
