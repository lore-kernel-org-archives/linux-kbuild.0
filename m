Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:36047 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753366AbbETWCc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:32 -0400
Received: by pabts4 with SMTP id ts4so81515884pab.3
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:32 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: 
Date: Wed, 20 May 2015 15:00:50 -0700
Message-Id: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com

From Olof Johansson <olof@lixom.net> # This line is ignored.
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 00/10] merge_config.sh: Misc reworks
In-Reply-To: 

Hi,

Somewhat wide distribution list here, since I've added everyone who's
touched the script, with the presumption that those have been the major
users of it. Please make sure none of these changes break your usecases.


I've done some reworks of merge_config.sh. I was quite hesitant to start
this since there are no good ways to see if your changes break others
or not, so the first thing I did was to add some tests. I know this is
highly unorthodox so try not to panic.

As far as what this series does is:

- Adds a way to pass in CONFIG_FOO=<value> on the command line, it gets
  treated as a single-entry fragment

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
