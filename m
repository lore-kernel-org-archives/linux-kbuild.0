Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:24674 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750881AbdFFGNm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2017 02:13:42 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] tags: honor COMPILED_SOURCE with apart output directory
References: <1496663955-8499-1-git-send-email-robert.jarzmik@free.fr>
        <CAK7LNASUowYYh16-PuWdqxq1U30hCZZF4_kQeud2VnF3xsiE1Q@mail.gmail.com>
Date: Tue, 06 Jun 2017 08:13:37 +0200
In-Reply-To: <CAK7LNASUowYYh16-PuWdqxq1U30hCZZF4_kQeud2VnF3xsiE1Q@mail.gmail.com>
        (Masahiro Yamada's message of "Tue, 6 Jun 2017 08:58:05 +0900")
Message-ID: <8737bd1w4u.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Hi Robert,
>
> I wanted you to update the log.
>
> 2017-06-05 20:59 GMT+09:00 Robert Jarzmik <robert.jarzmik@free.fr>:
>> When the kernel is compiled with an "O=" argument, the object files are
>> not necessarily in the source tree, and more probably in another tree.
>
> Always in another tree.
>
>> In this situation, the current used check doesn't work, and
>> COMPILED_SOURCE tags is broken with O= builds.
>>
>> This patch fixes it by looking for object files both in source tree and
>> potential destination tree.
>
> only in the destination tree.
>
>
>> It was verified that in the case of O= usage, the current directory is
>> the build tree, ie. the tree referenced by O=xxx, and j is the source
>> tree path concatenated with relative path of the object to the source
>> tree root, hence the simple expression to compute "k" as the built
>> object.
>
> "k" is no longer used in v3.
>
>
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
>
>
> I fixed up the git description and applied to linux-kbuild/fixes.
> If you see something wrong, please let me know.
Your changes are perfectly correct, thanks.

Cheers.

-- 
Robert
