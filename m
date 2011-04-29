Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:44368 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932247Ab1D2WwY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2011 18:52:24 -0400
Date: Fri, 29 Apr 2011 15:52:21 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH V2 7/7] kbuild: move docproc from scripts/basic to
 scripts
Message-Id: <20110429155221.64e437d7.rdunlap@xenotime.net>
In-Reply-To: <4DBB3DED.1060508@verizon.net>
References: <4DBB3DED.1060508@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pefoley2@verizon.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Fri, 29 Apr 2011 18:38:37 -0400 Peter Foley wrote:

> This patch moves docproc from scripts/basic to scripts.
> 
> Signed-off-by: Peter Foley <pefoley2@verizon.net>
> ---
>  scripts/{basic => }/docproc.c |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename scripts/{basic => }/docproc.c (100%)
> 
> diff --git a/scripts/basic/docproc.c b/scripts/docproc.c
> similarity index 100%
> rename from scripts/basic/docproc.c
> rename to scripts/docproc.c
> -- 


patch -p1 -bs --dry-run  < ~/0007-kbuild-move-docproc-from-scripts-basic-to-scripts.patch 
patch: **** Only garbage was found in the patch input.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
