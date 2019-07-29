Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35305 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfG2Jvc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:51:32 -0400
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190728100906.18847-1-efremov@linux.com>
 <CAK7LNAR9Gzeh6s2QGRF55ORCt1MMSit_cagx-+Ooor_sRC1U8w@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <21351100-46f2-1ce8-e5ed-722b0ca42801@linux.com>
Date: Mon, 29 Jul 2019 12:51:22 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR9Gzeh6s2QGRF55ORCt1MMSit_cagx-+Ooor_sRC1U8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 29.07.2019 06:29, Masahiro Yamada wrote:
> may I ask you to use 'int' instead of 'size_t' here?

Fixed in v2.

Regards,
Denis
