Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36758 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751116AbbJ1Ama (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:30 -0400
Received: by pacik9 with SMTP id ik9so26375080pac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:30 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 00/10] merge_config misc reworks and testcases
Date: Wed, 28 Oct 2015 09:42:01 +0900
Message-Id: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

Hi,

Somewhat wide distribution list here, since I've added everyone who's
touched the script, with the presumption that those have been the major
users of it. Please make sure none of these changes break your use cases.

I've done some reworks of merge_config.sh. I was quite hesitant to start
this since there are no good ways to see if your changes break others
or not, so the first thing I did was to add some tests. I know this is
highly unorthodox so try not to panic. :-)

As far as what this series does is:

- Adds a way to pass in CONFIG_FOO=<value> on the command line, it gets
  treated as a single-entry fragment file

- The script now prints the warnings on stderr, and returns non-0 when
  something is encountered

- Optionally, it'll also return non-0 when a redundant entry is found. I
  presumed people rely on -r not being a failure so I did this separately

- CONFIG_FOO=n and "# CONFIG_FOO is not set" is now treated the same,
  and using the former doesn't cause an invalid warning when the results
  are checked at the end

- Slightly odd things happened if a fragment contains the same option
  twice: It'd produce a warning that was malformed. Now just ignore that
  and use only the latest value of said option.


-Olof

