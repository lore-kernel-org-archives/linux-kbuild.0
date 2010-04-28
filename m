Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:48870 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751396Ab0D1Ilq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Apr 2010 04:41:46 -0400
Message-ID: <4BD7F4C8.4080107@suse.cz>
Date: Wed, 28 Apr 2010 10:41:44 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [patch 1/1] markup_oops: fix perlcritic warnings
References: <201004272112.o3RLCrlB020200@imap1.linux-foundation.org>
In-Reply-To: <201004272112.o3RLCrlB020200@imap1.linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, shemminger@vyatta.com, amwang@redhat.com, arjan@infradead.org

On 27.4.2010 23:12, akpm@linux-foundation.org wrote:
> From: Stephen Hemminger <shemminger@vyatta.com>
> 
> Turn on strict checking.
> Use local file handles and 3 argument open.

Hi Andrew, Stephen,

as I wrote earlier, this patch is incomplete:
$ perl scripts/markup_oops.pl
Global symbol "$lastword" requires explicit package name at
scripts/markup_oops.pl line 110.
Global symbol "$clobber" requires explicit package name at
scripts/markup_oops.pl line 119.
Global symbol "$lastword" requires explicit package name at
scripts/markup_oops.pl line 119.
Global symbol "$clobber" requires explicit package name at
scripts/markup_oops.pl line 121.
Global symbol "$clobber" requires explicit package name at
scripts/markup_oops.pl line 123.
Global symbol "$clobber" requires explicit package name at
scripts/markup_oops.pl line 128.
Global symbol "$clobber" requires explicit package name at
scripts/markup_oops.pl line 132.
Global symbol "$lastword" requires explicit package name at
scripts/markup_oops.pl line 133.
Global symbol "$clobber" requires explicit package name at
scripts/markup_oops.pl line 143.
Global symbol "$lastword" requires explicit package name at
scripts/markup_oops.pl line 151.
Global symbol "$file" requires explicit package name at
scripts/markup_oops.pl line 268.
Execution of scripts/markup_oops.pl aborted due to compilation errors.

Please drop it from -mm.

Thanks,
Michal
