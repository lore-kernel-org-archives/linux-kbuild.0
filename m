Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:52025 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755039Ab1D2Wqw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 18:46:52 -0400
Date: Fri, 29 Apr 2011 15:46:49 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH V2 0/7] kbuild: move scripts/basic/docproc.c to
 scripts/docproc.c
Message-Id: <20110429154649.848f9ba8.rdunlap@xenotime.net>
In-Reply-To: <4DBB3DD4.9000000@verizon.net>
References: <4DBB3DD4.9000000@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pefoley2@verizon.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, 29 Apr 2011 18:38:12 -0400 Peter Foley wrote:

> This patchset moves scripts/basic/docproc to scripts/docproc.
> This causes docproc to only be built for *doc targets rather than every
> time the kernel is compiled.
> 
> Patches also attached as requested by Michal Marek.


That's disappointing (the attachments).  Why was this requested?

See Documentation/CodingStyle, section 7:

"No MIME, no links, no compression, no attachments.  Just plain text."


It also causes breakage in other people's patch merging/testing.
E.g., I cannot save any one of these emails as I can with other patches
and get a useful patch file.  Instead, the saved file contains lines like
this (below) and each patch 2 times (inline and attachment).

--------------060706070408040606010200
Content-Type: text/plain;
	name="kbuild-update-DocBook-Makefile-in-preperation-for-mo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-update-DocBook-Makefile-in-preperation-for-mo.patch"



---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
