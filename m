Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33534 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965548AbbD1NbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 09:31:12 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [GIT PULL 00/64] perf/core improvements and fixes
Date: Tue, 28 Apr 2015 10:29:52 -0300
Message-Id: <1430227856-25825-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Andi Kleen <ak@linux.intel.com>, Andi Kleen <andi@firstfloor.org>, Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <david.ahern@oracle.com>, David Howells <dhowells@redhat.com>, Don Zickus <dzickus@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, He Kuang <hekuang@huawei.com>, Jeremie Galarneau <jgalar@efficios.com>, Jiri Olsa <jolsa@redhat.com>, linux-kbuild@vger.kernel.org, Mark Rutland <Mark.Rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <peterz@infradead.org>, Petr Holasek <pholasek@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Stephane Eranian <eranian@google.com>, Steven Rostedt <rostedt@goodmis.org>, Taeung Song <treeze.taeung@gmail.com>, Tom Zanussi <tzanussi@gmail.com>, Wang Nan <wangnan0@huawei.com>, Will Deacon <will.deacon@arm.com>, William Cohen <wcohen@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Ingo,

	Please consider pulling, more to come soon,

- Arnaldo

The following changes since commit 5b24e8cf618f03b4f1275c229d0a1d464648f9e2:

  Merge tag 'perf-core-for-mingo-2' of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux into perf/urgent (2015-04-14 14:10:56 +0200)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git tags/perf-core-for-mingo

for you to fetch changes up to 83c4bb5d87922f336a77125e3698928b661ee57e:

  perf bench numa: Show more stats of particular threads in verbose mode (2015-04-28 09:57:26 -0300)

----------------------------------------------------------------
perf/core improvements and fixes:

User visible:

- Add 'perf stat' metrics support for exclude_(host|guest|hv|idle) (Jiri Olsa)

- Fix 'perf stat' metrics calculation with event qualifiers (Andi Kleen)

- Improve event parsing error reporting (Jiri Olsa)

- Fix 'perf trace' --filter-pids OPTION description (Arnaldo Carvalho de Melo)

- Clarify that 'perf trace -e' is about syscalls, not perf events in general (Arnaldo Carvalho de Melo)

- Show error message when 'perf data' conversion failed (He Kuang)

- Remove all probe matches given pattern at once in 'perf probe --del' (Masami Hiramatsu)

- Make 'perf probe --funcs' option exclusive (Masami Hiramatsu)

- Document --children option (top, report) in more detail (Namhyung Kim)

- Show more stats of particular threads in verbose mode in 'perf bench numa' (Petr Holasek)

Infrastructure:

- AUX area tracing work needed for processing Intel PT data (Adrian Hunter)

- Add build tests for building perf from kernel source root and tools (Jiri Olsa)

- Enable 'perf data' stream flush within processing (Jiri Olsa)

- Add support for setting ordered_events queue size in 'perf data' (Jiri Olsa)

- Refactor the perf hists browser (top, report) to break down big function into
  smaller ones, remove unused state (Namhyung Kim)

- Switch 'perf data' to libbabeltrace's multiple cpu stream files (Sebastian Andrzej Siewior)

- Fix duplicate field names and avoid reserved keywords in 'perf data' CTF support (Wang Nan)

- Fix signedness of value in 'perf data' (Wang Nan)

- Use getconf to determine number of online CPUs, making the build process to find the
  right number of online CPUs on ARM (Will Deacon)

Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

----------------------------------------------------------------
Adrian Hunter (20):
      perf header: Add AUX area tracing feature
      perf evlist: Add support for mmapping an AUX area buffer
      perf tools: Add user events for AUX area tracing
      perf auxtrace: Add support for AUX area recording
      perf record: Add basic AUX area tracing support
      perf record: Extend -m option for AUX area tracing mmap pages
      perf tools: Add a user event for AUX area tracing errors
      perf session: Add hooks to allow transparent decoding of AUX area tracing data
      perf session: Add instruction tracing options
      perf auxtrace: Add helpers for AUX area tracing errors
      perf auxtrace: Add helpers for queuing AUX area tracing data
      perf auxtrace: Add a heap for sorting AUX area tracing queues
      perf auxtrace: Add processing for AUX area tracing events
      perf auxtrace: Add a hashtable for caching
      perf tools: Add member to struct dso for an instruction cache
      perf script: Add Instruction Tracing support
      perf inject: Re-pipe AUX area tracing events
      perf inject: Add Instruction Tracing support
      perf script: Add field option 'flags' to print sample flags
      perf tools: Add aux_watermark member of struct perf_event_attr

Andi Kleen (1):
      perf stat: Fix metrics calculation with event qualifiers

Arnaldo Carvalho de Melo (2):
      perf trace: Fix --filter-pids OPTION description
      perf trace: Clarify that -e is about syscalls, not perf events in general

He Kuang (1):
      perf data: Show error message when conversion failed

Jiri Olsa (19):
      tools lib traceevent: Add alias field to struct format_field
      tools build: No need to make libapi for perf explicitly
      tools build: Fix Makefile(s) to properly invoke tools build
      perf tests: Add build tests for building perf from kernel source root and tools
      perf data: Enable stream flush within processing
      perf data: Add support for setting ordered_events queue size
      perf tools: Add parse_events_error interface
      perf tools: Add flex support for parse_events_error
      perf tools: Always bail out when config_attr function fails
      perf tools: Change parse_events_add_pmu interface
      perf tools: Add location to pmu event terms
      perf tools: Add term support for parse_events_error
      perf tools: Add static terms support for parse_events_error
      perf tools: Add tracepoint support for parse_events_error
      perf tools: Add symbolic events support for parse_events_error
      perf stat: Change metrics context calculation
      perf stat: Add metrics support for exclude_hv
      perf stat: Add metrics support for exclude_(host|guest)
      perf stat: Add metrics support for exclude_idle

Masami Hiramatsu (2):
      perf probe: Make --funcs option exclusive
      perf probe: Remove all probes matches given pattern at once

Namhyung Kim (14):
      perf hists: Get rid of position field from struct hist_entry
      perf diff: Make hist_entry_diff fields union
      perf tools: Document --children option in more detail
      perf tools: Move TUI-specific fields into unnamed union
      perf tools: Move init_have_children field to the unnamed union
      perf hists browser: Fix possible memory leak
      perf hists browser: Save hist_browser_timer pointer in hist_browser
      perf hists browser: Save pstack in the hist_browser
      perf hists browser: Save perf_session_env in the hist_browser
      perf hists browser: Split popup menu actions
      perf hists browser: Split popup menu actions - part 2
      perf tools: Introduce pstack_peek()
      perf hists browser: Simplify zooming code using pstack_peek()
      perf tools: Move TUI-specific fields out of map_symbol

Petr Holasek (1):
      perf bench numa: Show more stats of particular threads in verbose mode

Sebastian Andrzej Siewior (1):
      perf data: Switch to multiple cpu stream files

Wang Nan (2):
      perf data: Fix duplicate field names and avoid reserved keywords
      perf data: Fix signedness of value

Will Deacon (1):
      perf tools: Use getconf to determine number of online CPUs

 Makefile                                           |    5 +-
 tools/Makefile                                     |   20 +-
 tools/lib/traceevent/event-parse.c                 |    6 +-
 tools/lib/traceevent/event-parse.h                 |    1 +
 .../callchain-overhead-calculation.txt             |  108 ++
 tools/perf/Documentation/perf-inject.txt           |   26 +
 tools/perf/Documentation/perf-probe.txt            |    2 +
 tools/perf/Documentation/perf-record.txt           |    2 +
 tools/perf/Documentation/perf-report.txt           |    4 +
 tools/perf/Documentation/perf-script.txt           |   36 +-
 tools/perf/Documentation/perf-top.txt              |    3 +-
 tools/perf/Documentation/perf-trace.txt            |    2 +-
 tools/perf/Makefile                                |    2 +-
 tools/perf/bench/numa.c                            |   32 +-
 tools/perf/builtin-inject.c                        |  134 ++-
 tools/perf/builtin-probe.c                         |    2 +
 tools/perf/builtin-record.c                        |  130 ++-
 tools/perf/builtin-script.c                        |   45 +-
 tools/perf/builtin-stat.c                          |  146 ++-
 tools/perf/builtin-trace.c                         |    7 +-
 tools/perf/perf.h                                  |    2 +
 tools/perf/tests/code-reading.c                    |    2 +-
 tools/perf/tests/evsel-roundtrip-name.c            |    4 +-
 tools/perf/tests/hists_cumulate.c                  |    2 +-
 tools/perf/tests/hists_filter.c                    |    4 +-
 tools/perf/tests/hists_link.c                      |    4 +-
 tools/perf/tests/hists_output.c                    |    2 +-
 tools/perf/tests/keep-tracking.c                   |    4 +-
 tools/perf/tests/make                              |   14 +-
 tools/perf/tests/parse-events.c                    |    2 +-
 tools/perf/tests/perf-time-to-tsc.c                |    2 +-
 tools/perf/tests/pmu.c                             |    3 +-
 tools/perf/tests/switch-tracking.c                 |    8 +-
 tools/perf/ui/browsers/hists.c                     |  611 ++++++-----
 tools/perf/util/Build                              |    1 +
 tools/perf/util/auxtrace.c                         | 1069 ++++++++++++++++++++
 tools/perf/util/auxtrace.h                         |  426 ++++++++
 tools/perf/util/callchain.h                        |    4 +
 tools/perf/util/data-convert-bt.c                  |  410 +++++++-
 tools/perf/util/dso.c                              |    2 +
 tools/perf/util/dso.h                              |    3 +
 tools/perf/util/event.c                            |    3 +
 tools/perf/util/event.h                            |   46 +
 tools/perf/util/evlist.c                           |   71 +-
 tools/perf/util/evlist.h                           |    6 +
 tools/perf/util/evsel.c                            |    1 +
 tools/perf/util/header.c                           |   14 +
 tools/perf/util/header.h                           |    1 +
 tools/perf/util/hist.c                             |    2 +-
 tools/perf/util/parse-events.c                     |  194 +++-
 tools/perf/util/parse-events.h                     |   36 +-
 tools/perf/util/parse-events.l                     |   41 +-
 tools/perf/util/parse-events.y                     |   48 +-
 tools/perf/util/pmu.c                              |   57 +-
 tools/perf/util/pmu.h                              |    6 +-
 tools/perf/util/probe-event.c                      |   26 +-
 tools/perf/util/pstack.c                           |    7 +
 tools/perf/util/pstack.h                           |    1 +
 tools/perf/util/record.c                           |   15 +-
 tools/perf/util/session.c                          |  152 ++-
 tools/perf/util/session.h                          |    5 +
 tools/perf/util/sort.h                             |   38 +-
 tools/perf/util/symbol.h                           |    2 -
 tools/perf/util/tool.h                             |   10 +-
 64 files changed, 3563 insertions(+), 511 deletions(-)
 create mode 100644 tools/perf/Documentation/callchain-overhead-calculation.txt
 create mode 100644 tools/perf/util/auxtrace.c
 create mode 100644 tools/perf/util/auxtrace.h
