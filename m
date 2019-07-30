Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42428 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfG3HAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 03:00:01 -0400
Subject: Re: [PATCH v3] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190729141801.31333-1-efremov@linux.com>
 <20190730082618.5bb5edf3@canb.auug.org.au>
From: Denis Efremov <efremov@linux.com>
Message-ID: <1b6f749c-2a25-219a-3eb3-0f2c7a542426@linux.com>
Date: Tue, 30 Jul 2019 09:59:56 +0300
MIME-Version: 1.0
In-Reply-To: <20190730082618.5bb5edf3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 30.07.2019 01:26, Stephen Rothwell wrote:
> Hi Denis,
> 
> On Mon, 29 Jul 2019 17:18:01 +0300 Denis Efremov <efremov@linux.com> wrote:
>>
>> This patch adds a check to warn about static EXPORT_SYMBOL* functions
>> during the modpost. In most of the cases, a static symbol marked for
>> exporting is an odd combination that should be fixed either by deleting
>> the exporting mark or by removing the static attribute and adding the
>> appropriate declaration to headers.
> 
> OK, this is now in linux-next and I am getting what look like false
> positives :-(
> 
> My powerpc builds produce these:
> 
> WARNING: "ahci_em_messages" [vmlinux] is the static EXPORT_SYMBOL_GPL
> WARNING: "ftrace_set_clr_event" [vmlinux] is the static EXPORT_SYMBOL_GPL
> WARNING: "empty_zero_page" [vmlinux] is the static EXPORT_SYMBOL
> WARNING: "jiffies" [vmlinux] is the static EXPORT_SYMBOL
> 
> empty_zero_page (at least) is not static.  It is defined in assembler ...

This could be fixed either by adding the type, for example:
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -478,6 +478,7 @@ EXPORT_SYMBOL(phys_base)

         __PAGE_ALIGNED_BSS
  NEXT_PAGE(empty_zero_page)
+.type empty_zero_page, STT_OBJECT
         .skip PAGE_SIZE
  EXPORT_SYMBOL(empty_zero_page)

Or by updating the check in the patch:
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1988,7 +1988,9 @@ static void read_symbols(const char *modname)
                 unsigned char bind = ELF_ST_BIND(sym->st_info);
                 unsigned char type = ELF_ST_TYPE(sym->st_info);

-               if (type == STT_OBJECT || type == STT_FUNC) {
+               if (type == STT_OBJECT ||
+                   type == STT_FUNC ||
+                   type == STT_NOTYPE) {

Do I need to resend the whole patch or create new "patch-on-patch"?

Denis
