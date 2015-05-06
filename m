Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35426 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751441AbbEFNaa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 09:30:30 -0400
Message-ID: <554A1774.6080801@suse.cz>
Date: Wed, 06 May 2015 15:30:28 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] builddeb: fix stripped module signatures if CONFIG_DEBUG_INFO
 and CONFIG_MODULE_SIG_ALL are set
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com> <55365798.4090302@suse.cz> <20150422155700.GD32026@gluino> <20150504153724.GA26392@nest>
In-Reply-To: <20150504153724.GA26392@nest>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Skvortsov <Andrej.Skvortzov@gmail.com>
Cc: maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2015-05-04 17:37, Andrey Skvortsov wrote:
> On 22 Apr, maximilian attems wrote:
>> On Tue, Apr 21, 2015 at 03:58:48PM +0200, Michal Marek wrote:
>>> (added Max to Cc)
>>>
>>> On 2015-03-16 09:20, Andrey Skvortsov wrote:
>>>> If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules are
>>>> automatically signed in the result package, as it's for rpm-pkg, binrpm-pkg,
>>>> tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
>>>> is NOT set. In that case deb-package contains signed modules.
>>>>
>>>> But if CONFIG_DEBUG_INFO is set, builddeb creates separate package with
>>>> debug information. To do that, debug information from all modules
>>>> is copied into separate files by objcopy. And loadable kernel modules are
>>>> stripped afterwards. Stripping removes previously (during modules_install)
>>>> added signatures from loadable kernel modules. Therefore final deb-package
>>>> contains unsigned modules despite of set option CONFIG_MODULE_SIG_ALL.
>>>>
>>>> This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is set
>>>> to solve this problem.
>>>>
>>>> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
>>>
>>> Max, Ben, are you fine with this patch? It looks OK to me, the
>>> modules_sign target has been added for this very purpose.
>>>
>>
>> Ben seems busy with the release, so jumping in. The patch looks
>> perfect to me.
>>
>> Acked-by: maximilian attems <max@stro.at>
>>
> Maximilian, thanks for the review.
> 
> Michal, are we waiting for Ben's acknowledge too?

I applied the patch to kbuild.git#misc now, after fixing the whitespace.
Andrey, please use tabs for indentation, especially when the surrounding
code is already using this style.

Michal
