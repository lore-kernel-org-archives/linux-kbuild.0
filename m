Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33068 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbeIZCbt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Sep 2018 22:31:49 -0400
Received: by mail-oi1-f196.google.com with SMTP id a203-v6so2627957oib.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Sep 2018 13:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <153622549721.14298.8116794954073122489.stgit@warthog.procyon.org.uk>
 <153622556444.14298.5971956747198405225.stgit@warthog.procyon.org.uk>
In-Reply-To: <153622556444.14298.5971956747198405225.stgit@warthog.procyon.org.uk>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Sep 2018 13:22:21 -0700
Message-ID: <CAPcyv4jjxh955mWEubnGiENVQVeCcZ9YWv8YPBKfWMw-gh1z2w@mail.gmail.com>
Subject: Re: [PATCH 09/11] UAPI: ndctl: Fix g++-unsupported initialisation in
 headers [ver #2]
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux API <linux-api@vger.kernel.org>, linux-kbuild@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 6, 2018 at 2:19 AM David Howells <dhowells@redhat.com> wrote:
>
> The following code in the linux/ndctl header file:
>
>         static inline const char *nvdimm_bus_cmd_name(unsigned cmd)
>         {
>                 static const char * const names[] = {
>                         [ND_CMD_ARS_CAP] = "ars_cap",
>                         [ND_CMD_ARS_START] = "ars_start",
>                         [ND_CMD_ARS_STATUS] = "ars_status",
>                         [ND_CMD_CLEAR_ERROR] = "clear_error",
>                         [ND_CMD_CALL] = "cmd_call",
>                 };
>
>                 if (cmd < ARRAY_SIZE(names) && names[cmd])
>                         return names[cmd];
>                 return "unknown";
>         }
>
> is broken in a number of ways:
>
>  (1) ARRAY_SIZE() is not generally defined.
>
>  (2) g++ does not support "non-trivial" array initialisers fully yet.
>
>  (3) Every file that calls this function will acquire a copy of names[].
>
> The same goes for nvdimm_cmd_name().
>
> Fix all three by converting to a switch statement where each case returns a
> string.  That way if cmd is a constant, the compiler can trivially reduce it
> and, if not, the compiler can use a shared lookup table if it thinks that is
> more efficient.
>
> A better way would be to remove these functions and their arrays from the
> header entirely.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Dan Williams <dan.j.williams@intel.com>

Acked-by: Dan Williams <dan.j.williams@intel.com>

...again let me know if you'll take this with g++ series or want me to
carry it directly.
