Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34700 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753775Ab1DESJH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 14:09:07 -0400
Message-ID: <4D9B5AC4.70103@suse.cz>
Date: Tue, 05 Apr 2011 20:09:08 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 07/34] kbuild: Allow to override LINUX_COMPILE_BY and
 LINUX_COMPILE_HOST macros
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz> <1302015561-21047-8-git-send-email-mmarek@suse.cz> <4D9B3AA4.5090402@fastmail.fm>
In-Reply-To: <4D9B3AA4.5090402@fastmail.fm>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jack Stone <jwjstone@fastmail.fm>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 5.4.2011 17:52, Jack Stone napsal(a):
> On 05/04/2011 15:58, Michal Marek wrote:
>> -  echo \#define LINUX_COMPILE_BY \"`whoami`\"
>> -  echo \#define LINUX_COMPILE_HOST \"`hostname | $UTS_TRUNCATE`\"
>> +  echo \#define LINUX_COMPILE_BY \"`echo $KBUILD_BUILD_USER | $UTS_TRUNCATE`\"
>> +  echo \#define LINUX_COMPILE_HOST \"`echo $KBUILD_BUILD_HOST | $UTS_TRUNCATE`\"
>
> Shouldn't these be the variables defined above otherwise we get empty
> LINUX_COMPILE_{BY,HOST} in the case the corresponding environment
> variable is unset.

Good catch. I'll fix it.

Thanks for the review.

Michal
