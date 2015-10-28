Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [64.129.254.146] ([64.129.254.146]:13898 "EHLO mail5.wrs.com"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753192AbbJ1GbV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 02:31:21 -0400
Message-ID: <56306B9D.9040109@windriver.com>
Date: Wed, 28 Oct 2015 02:30:53 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 05/10] merge_config.sh: Better handling of CONFIG_FOO=n
References: <1445992931-28107-1-git-send-email-olof@lixom.net> <1445992931-28107-6-git-send-email-olof@lixom.net> <20151028062654.GG1854@malice.jf.intel.com>
In-Reply-To: <20151028062654.GG1854@malice.jf.intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Olof Johansson <olof@lixom.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On 10/28/2015 02:26 AM, Darren Hart wrote:
> On Wed, Oct 28, 2015 at 09:42:06AM +0900, Olof Johansson wrote:
>> Kconfig knows how to handle CONFIG_FOO=n just fine, but it'll always
>> use "# CONFIG FOO is not set" in the resulting config. Mangle the input
>> accordingly so we don't report this as a failure when it isn't.
>>
>> Signed-off-by: Olof Johansson <olof@lixom.net>
>
> Matching Kconfig behavior is the logical approach, no point in complaining if
> Kconfig will accpet the result.
>
> Bruce, I think we'll just need to update the linux-yocto tool documentation not
> to mark =n as wrong.

purists still think it is wrong :) The tools don't report this as
an error anymore, so there's no change here.

Bruce

>
> Reviewed-by: Darren Hart <dvhart@linux.intel.com>
>

