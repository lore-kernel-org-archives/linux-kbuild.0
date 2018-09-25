Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38614 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbeIZC1V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Sep 2018 22:27:21 -0400
Received: by mail-ot1-f66.google.com with SMTP id h15-v6so2040666otj.5
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Sep 2018 13:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <153622549721.14298.8116794954073122489.stgit@warthog.procyon.org.uk>
 <153622557095.14298.10281337300003012767.stgit@warthog.procyon.org.uk>
In-Reply-To: <153622557095.14298.10281337300003012767.stgit@warthog.procyon.org.uk>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Sep 2018 13:17:54 -0700
Message-ID: <CAPcyv4gmMwRAG=VxWNyeacxdsPCsaT+BtR+27+bHT=6heAZ3sQ@mail.gmail.com>
Subject: Re: [PATCH 10/11] UAPI: ndctl: Remove use of PAGE_SIZE [ver #2]
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux API <linux-api@vger.kernel.org>, linux-kbuild@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Sep 6, 2018 at 2:19 AM David Howells <dhowells@redhat.com> wrote:
>
> The macro PAGE_SIZE isn't valid outside of the kernel, so it should not
> appear in UAPI headers.
>
> Furthermore, the actual machine page size could theoretically change from
> an application's point of view if it's running in a container that gets
> migrated to another machine (say 4K/ppc64 to 64K/ppc64).
>
> Fixes: f2ba5a5baecf ("libnvdimm, namespace: make min namespace size 4K")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Dan Williams <dan.j.williams@intel.com>

Acked-by: Dan Williams <dan.j.williams@intel.com>

Let me know if you want me to pick this up for 4.20.
