Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49729 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752512AbbIBGJy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 02:09:54 -0400
Subject: Re: [PATCH] package/Makefile: move source tar creation to a function
References: <1441115335-25165-1-git-send-email-riku.voipio@linaro.org>
 <CA+r1ZhgpBNwHqivqiyV7b-39GSOtpyzDhCkeSqPV8LpZ3aasTQ@mail.gmail.com>
 <CAAqcGHnrKU4DJanSJUJMdd6vz2_OR5X2Z51NmrzX1RpT1RQQXw@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55E692B0.1030107@suse.cz>
Date: Wed, 2 Sep 2015 08:09:52 +0200
MIME-Version: 1.0
In-Reply-To: <CAAqcGHnrKU4DJanSJUJMdd6vz2_OR5X2Z51NmrzX1RpT1RQQXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 2.9.2015 v 06:58 Riku Voipio napsal(a):
> On 1 September 2015 at 17:31, Jim Davis <jim.epost@gmail.com> wrote:
>>> - Replace symlink to self with tar --transform
> 
>> While probably everyone -- or almost everyone -- uses gnu tar, that
>> particular option isn't available in older versions of gnu tar
>> (https://groups.google.com/forum/#!topic/uk.comp.os.linux/-7LDdMSRo5w).
>> Perhaps something could be added to Documentation/Changes about the
>> gnu tar version required?
> 
> Looking at the changelog, this was added to tar 1.16 which was
> released in 2006. Nine years sounds like a reasonable timeframe to
> expect a feature being available?

But it costs us only a this ln and rm invocation to continue supporting
older GNU tar versions and non-GNU implementation. So I'd leave this
part as is. The rest of the patch is OK.

Michal

