Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:38562 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702Ab1EPEHz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2011 00:07:55 -0400
Received: by qwk3 with SMTP id 3so2059885qwk.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 May 2011 21:07:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1305518795-9360-1-git-send-email-lacombar@gmail.com>
References: <1305518795-9360-1-git-send-email-lacombar@gmail.com>
Date: Mon, 16 May 2011 00:07:54 -0400
Message-ID: <BANLkTimVr-4Bd-Wjd2dckYD_sq1ka6bTgQ@mail.gmail.com>
Subject: Re: [RFC] kconfig: zconfdump() clean-up
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

On Mon, May 16, 2011 at 12:06 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> config A
>  boolean
>  symbol
actually, this "symbol" property should not appear in the dump.

 - Arnaud
