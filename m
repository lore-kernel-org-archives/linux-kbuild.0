Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:50091 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753854AbbAGGLV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2015 01:11:21 -0500
Received: by mail-wi0-f178.google.com with SMTP id em10so856319wid.11
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jan 2015 22:11:20 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <54AC3C49.305@suse.cz>
References: <1420278619-6637-1-git-send-email-sedat.dilek@gmail.com>
	<CA+icZUXMUOh-P6mK4hAjPX=yVWJ9Lh=3AbWPEfmDKCpMpn9C3w@mail.gmail.com>
	<54AC3C49.305@suse.cz>
Date: Wed, 7 Jan 2015 07:11:20 +0100
Message-ID: <CA+icZUWvjK351SpgQ0NpO6W7rvC_eBbdEibN1S7ihxZOazLTsw@mail.gmail.com>
Subject: Re: [PATCH v6] builddeb: Try to determine distribution
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Thorsten Glaser <tg@mirbsd.org>, Alexander Wirt <formorer@debian.org>, linux-kbuild@vger.kernel.org

On Tue, Jan 6, 2015 at 8:49 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 6.1.2015 v 12:39 Sedat Dilek napsal(a):
>> On Sat, Jan 3, 2015 at 10:50 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>>> lsb_release command is a good choice to determine the distribution
>>> name for the changelog file in the generated Debian packages [1].
>>> Its installation is no precondition.
>>> In Debian it is still not essential or build-essential.
> [...]
>> According to your explanations about your development workflow and Git
>> trees this can go now to kbuild.git#misc.
>
> I applied it to kbuild.git#misc now.
>

Thanks.

- Sedat -
