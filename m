Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:61250 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751249Ab0HWARX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Aug 2010 20:17:23 -0400
Received: by wyb32 with SMTP id 32so6162000wyb.19
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Aug 2010 17:17:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282521786-26699-1-git-send-email-lacombar@gmail.com>
References: <AANLkTindfnx2htJ--AjyMsKatjkAfXmH+po3pGz6DmfD@mail.gmail.com>
	<1282521786-26699-1-git-send-email-lacombar@gmail.com>
Date: Sun, 22 Aug 2010 20:17:21 -0400
Message-ID: <AANLkTimrN2=DZrAgh=Q4NCgz+UhJ+THdwGPoJRK_826c@mail.gmail.com>
Subject: Re: [PATCH] kbuild: don't overwrite HOST_EXTRACFLAGS
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Hi,

On Sun, Aug 22, 2010 at 8:03 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> These might be used by the user to specify extra arguments for the host
> compiler.
>
Do'h... the original patch was against -rc1 and changed both
HOST_EXTRACFLAGS and HOST_LOADLIBES, but I cherry-picked it to be
against your `for-next' and more particularly commit 7080e47bb, which
removes the assignation of HOST_LOADLIBES. As I didn't pay attention
and kept the plural :/

Anyway, with this patch and specifying HOST_EXTRACFLAGS in the
environment rather than as a gmake(1) argument, it is properly
appended. nconf links and runs fine on NetBSD. It should not impact
other environment.

 - Arnaud
