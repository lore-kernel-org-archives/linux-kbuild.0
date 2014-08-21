Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34896 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751007AbaHUJdA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Aug 2014 05:33:00 -0400
Message-ID: <53F5BCC8.4060000@suse.cz>
Date: Thu, 21 Aug 2014 11:32:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Make scripts executable
References: <1408543848-24977-1-git-send-email-mmarek@suse.cz> <20140821122521.2D67.AA925319@jp.panasonic.com>
In-Reply-To: <20140821122521.2D67.AA925319@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014-08-21 05:25, Masahiro Yamada wrote:
> Hi Michal,
> 
> 
> On Wed, 20 Aug 2014 16:10:48 +0200
> Michal Marek <mmarek@suse.cz> wrote:
> 
>> The Makefiles call the respective interpreter explicitly, but this makes
>> it easier to use the scripts manually.
>>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> 
> I am not sure at all, but
> it seems scripts/checkpatch.pl has a rule
> to ban execute permissions.

I didn't know about this, but the intent of the rule seems to be to
avoid *.c files with execute permissions.


> # Check for incorrect file permissions
>                 if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
>                         my $permhere = $here . "FILE: $realfile\n";
>                         if ($realfile !~ m@scripts/@ &&
>                             $realfile !~ /\.(py|pl|awk|sh)$/) {

Here it explicitly skips files below scripts/ and files with known
script suffixes.

Michal
