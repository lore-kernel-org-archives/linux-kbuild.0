Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49710 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755466AbcFTPFA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jun 2016 11:05:00 -0400
Subject: Re: Automatic dependency resolution on generated python file
References: <57438C01.6090601@bingham.xyz>
From: Michal Marek <mmarek@suse.com>
Message-ID: <576802A4.5040804@suse.com>
Date: Mon, 20 Jun 2016 16:50:12 +0200
MIME-Version: 1.0
In-Reply-To: <57438C01.6090601@bingham.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kieran Bingham <kieran@ksquared.org.uk>
Cc: linux-kbuild@vger.kernel.org, Jan Kiszka <jan.kiszka@web.de>

On 2016-05-24 01:02, Kieran Bingham wrote:
> Hi Kbuild / Michal,
> 
> I've been working through a problem that Jan has reported whereby if we
> modify a file included by our template  for constants.py, the generated
> file is not rebuilt.
> 
> The rule/cmd [0] to generate the python constants is
> cmd_gen_constants_py which uses the $(CPP) with $(c_flags) to create the
> output.
> 
> One benefit of this is that it already creates the $(depfile) through
> the addition of the flags provided by $(c_flags), however as yet it
> would seem that my efforts to understand how the $(depfile) gets
> included have failed.
> 
> From what I can tell, the $(call if_changed...) rule is generating my
> targets .constants.py.cmd, but the .d file is not being utilised.
> 
> By swapping $(call if_changed, ) to $(call if_changed_dep,...) I can see
> that my .constants.py.cmd [1] file now has (apparently) correct
> dependency rules being generated. However they still don't take actual
> effect. If I 'touch/modify' one of the files I have added to the
> #includes, then my target is not rebuilt (I have added
> include/linux/kieran.h for testing this specifically without rebuilding
> all other objects)

Hi Kieran,

sorry for the late reply. In case this is still relevant: For
if_changed/if_changed_dep to work, you must list the target in the
$(targets) list (without the $(obj) prefix) and add FORCE as a
prerequisite of the rule.

Michal
