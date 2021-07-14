Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C23FC1B08C
	for <linux-kbuild@archiver.kernel.org>; Wed, 14 Jul 2021 20:49:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8523F613C0
	for <linux-kbuild@archiver.kernel.org>; Wed, 14 Jul 2021 20:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhGNUvy (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 14 Jul 2021 16:51:54 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:44410 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNUvy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:51:54 -0400
Received: from in01.mta.xmission.com ([166.70.13.51]:38388)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m3loT-00G9kQ-Ca; Wed, 14 Jul 2021 14:49:01 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:51614 helo=email.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m3loS-00ADRq-9Q; Wed, 14 Jul 2021 14:49:00 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list\:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
        <20210704202756.29107-3-ojeda@kernel.org>
        <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
        <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
        <87mtqo1wv6.fsf@disp2133>
        <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
Date:   Wed, 14 Jul 2021 15:48:53 -0500
In-Reply-To: <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 14 Jul 2021 13:21:57 -0700")
Message-ID: <87a6mo1v0q.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m3loS-00ADRq-9Q;;;mid=<87a6mo1v0q.fsf@disp2133>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX186maXoDYNAZPSG3DdGCQFiPAEMHK+euQk=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Jul 14, 2021 at 1:09 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>>
>> Are you thinking the hashed kernel symbols need to have their types
>> included in the hash?
>
> I think the hash should be the whole mangled name. So yes, for Rust
> symbols they'd have the the type information.

Sorry I was meaning to ask should the C symbols that get hashed
include their types in the hash as well?  Because if everything
is going to be hashed we need to clear definition of what we do
with good old C symbols as well.

>>  Or is this just a hash to make the names a managable size?
>
> No, if that was the only point of it, the "just use two bytes for
> length" would be simpler.
>
> But I don't think we want to do run-time de-mangling of names in the
> kernel when doing stack traces, which implies that the kallsym
> information in the kernel should be the de-mangled names.
>
> That makes the names nice and readable, and also makes this "maximum
> symbol length" thing a non-issue.
>
> BUT.
>
> It also means that you can't use those names for linking purposes, so
> you'd then need to have a "full version" for that. But as Willy
> pointed out elsewhere, you might as well just use a constant-sized
> hash for that, rather than have both a manged and a de-mangled name.

Just to clarify.  We want this for the C symbols as well?

Eric

