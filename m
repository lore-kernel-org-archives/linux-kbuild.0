Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from a3.inai.de ([88.198.85.195]:47912 "EHLO a3.inai.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbeJJAMh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 20:12:37 -0400
Date: Tue, 9 Oct 2018 18:54:42 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [PATCH 04/11] UAPI: bcache: Fix use of embedded flexible array
In-Reply-To: <17992.1539099666@warthog.procyon.org.uk>
Message-ID: <nycvar.YFH.7.76.1810091847450.9618@n3.vanv.qr>
References: <nycvar.YFH.7.76.1810021622320.11696@n3.vanv.qr> <153616290368.23468.7806230605345568524.stgit@warthog.procyon.org.uk> <17992.1539099666@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Coly Li <colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 2018-10-09 17:41, David Howells wrote:

>Jan Engelhardt <jengelh@inai.de> wrote:
>
>> """it [the array size expression] shall be a converted constant expression of
>> type std::size_t and its value shall be greater than zero."""
>> —http://eel.is/c++draft/dcl.array
>
>Interesting.  You're not actually quoting the full sentence:
>
>	If the constant-expression is present, it shall be a converted
>	constant expression of type std​::​size_­t and its value shall be
>	greater than zero.
>
>This suggests that:
>
>	__u64 ptr[]
>
>is actually valid

I think that kind of validity only goes for this kind of standalone 
decl:

	extern int myints[];

but not for []-inside-struct.
