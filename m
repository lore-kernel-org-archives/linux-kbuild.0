Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38501 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfG2MrI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 08:47:08 -0400
Reply-To: efremov@linux.com
Subject: Re: [PATCH v2] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190729092250.32670-1-efremov@linux.com>
 <20190729222045.4b491ffb@canb.auug.org.au>
From: Denis Efremov <efremov@linux.com>
Message-ID: <2b6fc296-bf42-f99d-e420-3293471db033@linux.com>
Date: Mon, 29 Jul 2019 15:47:05 +0300
MIME-Version: 1.0
In-Reply-To: <20190729222045.4b491ffb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 7/29/19 3:20 PM, Stephen Rothwell wrote:
> Hi Denis,
> 
> Just a small note (nit? :-)):
> 
> On Mon, 29 Jul 2019 12:22:50 +0300 Denis Efremov <efremov@linux.com> wrote:
>>
>> +			if (s->is_static)
>> +				warn("\"%s\" [%s] is the static %s\n",
> 
> This read a little wrong to me, maybe "is a static"?
> 

Thank you! I will fix this in v3 in an hour.

Denis
