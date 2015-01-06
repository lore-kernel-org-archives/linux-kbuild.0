Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43143 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932342AbbAFTtc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Jan 2015 14:49:32 -0500
Message-ID: <54AC3C49.305@suse.cz>
Date: Tue, 06 Jan 2015 20:49:29 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v6] builddeb: Try to determine distribution
References: <1420278619-6637-1-git-send-email-sedat.dilek@gmail.com> <CA+icZUXMUOh-P6mK4hAjPX=yVWJ9Lh=3AbWPEfmDKCpMpn9C3w@mail.gmail.com>
In-Reply-To: <CA+icZUXMUOh-P6mK4hAjPX=yVWJ9Lh=3AbWPEfmDKCpMpn9C3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Thorsten Glaser <tg@mirbsd.org>, Alexander Wirt <formorer@debian.org>, linux-kbuild@vger.kernel.org

Dne 6.1.2015 v 12:39 Sedat Dilek napsal(a):
> On Sat, Jan 3, 2015 at 10:50 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> lsb_release command is a good choice to determine the distribution
>> name for the changelog file in the generated Debian packages [1].
>> Its installation is no precondition.
>> In Debian it is still not essential or build-essential.
[...]
> According to your explanations about your development workflow and Git
> trees this can go now to kbuild.git#misc.

I applied it to kbuild.git#misc now.

Michal

