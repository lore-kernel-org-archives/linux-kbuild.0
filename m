Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39067 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbfG3Qo6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:44:58 -0400
Subject: Re: [PATCH v3] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190729141801.31333-1-efremov@linux.com>
 <20190730082618.5bb5edf3@canb.auug.org.au>
 <1b6f749c-2a25-219a-3eb3-0f2c7a542426@linux.com>
 <CAK7LNATnC6eVmahn=44F-j3Uf-x+cUWuP0q7QuP800biL9QJiA@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <d26ff0d1-fc45-d5b5-fe84-26fa9df09c3e@linux.com>
Date: Tue, 30 Jul 2019 19:44:49 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNATnC6eVmahn=44F-j3Uf-x+cUWuP0q7QuP800biL9QJiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 30.07.2019 19:29, Masahiro Yamada wrote:
> I prefer this, but why do you need to check type?
> 
> Doesn't this work?
> 
> for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
>          unsigned char bind = ELF_ST_BIND(sym->st_info);
> 
>          struct symbol *s = find_symbol(remove_dot(info.strtab +
>                                                    sym->st_name));
> 
>          if (s && (bind == STB_GLOBAL || bind == STB_WEAK))
>                  s->is_static = 0;
> }

This works. However, I thought it will be too costly to call find_symbol 
on each symbol. Hence, 'type == STT_OBJECT || type == STT_FUNC || type 
== STT_NOTYPE' is a small performance optimization because we need to 
check only variables and functions. Is it worth to remove it in v4?

Denis
