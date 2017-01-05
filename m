Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37868 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938519AbdAEMUb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2017 07:20:31 -0500
Subject: Re: [PATCH 1/3] asm-prototypes: Clear any CPP defines before
 declaring the functions
References: <20170103141456.12743-1-mmarek@suse.com>
 <20170105093338.54fbe6k4n4362mld@pd.tnic>
From: Michal Marek <mmarek@suse.com>
Message-ID: <fb7fcc0b-609c-fbdc-8466-76288e0887e6@suse.com>
Date: Thu, 5 Jan 2017 13:20:13 +0100
MIME-Version: 1.0
In-Reply-To: <20170105093338.54fbe6k4n4362mld@pd.tnic>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>

On 2017-01-05 10:33, Borislav Petkov wrote:
> On Tue, Jan 03, 2017 at 03:14:54PM +0100, Michal Marek wrote:
>> During real build, this manifests itself by genksyms segfaulting.
>>
>> Reported-by: Borislav Petkov <bp@alien8.de>
> 
> ... -and-tested-by: ...
> 
> For all three.
> 
> Thanks!

Thanks for testing. I added 1/3 to kbuild.git#rc-fixes for -rc3 and the
remaining two to kbuild.git#kbuild for the next merge window.

Michal

