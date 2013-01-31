Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:61519 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751886Ab3AaKu4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jan 2013 05:50:56 -0500
Message-ID: <510A4C82.8090806@imgtec.com>
Date: Thu, 31 Jan 2013 10:50:42 +0000
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] depmod: pass -P $CONFIG_SYMBOL_PREFIX
References: <1359625303-11842-1-git-send-email-james.hogan@imgtec.com> <510A4967.5070009@suse.cz>
In-Reply-To: <510A4967.5070009@suse.cz>
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, uclinux-dist-devel@blackfin.uclinux.org

Hi Michal,

On 31/01/13 10:37, Michal Marek wrote:
> On 31.1.2013 10:41, James Hogan wrote:
>> On architectures which have symbol prefixes, depmod emits lots of false
>> warnings like this:
>>
>> WARNING: $module.ko needs unknown symbol $symbol
>>
>> This is because depmod isn't being passed the -P <symbol_prefix>
>> arguments to specify the symbol prefix to ignore. This option is
>> included since the 3.13 release of module-init-tools.
>>
>> Update scripts/depmod.sh to take extra arguments which are passed
>> through directly to depmod, and update the main Makefile to pass
>> -P $(CONFIG_SYMBOL_PREFIX to scripts/depmod.sh, but only if
>> CONFIG_SYMBOL_PREFIX is set and non-empty.
> 
> OK.
> 
> 
>> scripts/depmod.sh also drops the -P arguments if depmod --version
>> reports module-init-tools with a version number < 3.13.
> 
> You can replace the test with a simple
> 
> "$DEPMOD" -P _ --help 2>/dev/null >/dev/null

Thanks for the suggestion. It would be much cleaner, but unfortunately I
tried this on module-init-tools 3.3-pre2 and module-init-tools 3.9 and
both still return success.

Cheers
James

