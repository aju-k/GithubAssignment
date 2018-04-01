class GithubApis

    # Get commits of project according to given date range
    def self.get_datewise_commits(user, github, project, daterange)
        today = Date.today.strftime("%Y-%m-%d");
        daterange = daterange.present? ? daterange : today + " - " + today
        if daterange.present?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            dates = daterange.split()
            commits = github.repos.commits.list(project.owner.login, project.name, {"since": dates[0].strip, "until": dates[2].strip})
            chartDataHash = {}; chartData = [];
            commits.each do |data|
                if data.commit.author.date.present?
                    dateKey = Date.parse(data.commit.author.date).strftime("%D")
                    chartDataHash[dateKey].present? ? chartDataHash[dateKey] += 1 : chartDataHash[dateKey] = 1    
                end
            end
            chartDataHash.each do |obj|
                hash = {}
                hash["date"] = obj[0]
                hash["value"] = obj[1]
                chartData.push(hash)
            end
        end
        return chartData.to_json
    end
end
