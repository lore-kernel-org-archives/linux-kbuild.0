Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:34021 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933047AbbFVHjl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Jun 2015 03:39:41 -0400
Received: by lbbti3 with SMTP id ti3so103261122lbb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2015 00:39:40 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC 4/4] scripts: add stackdelta script
References: <1434849046-19920-1-git-send-email-linux@rasmusvillemoes.dk>
	<1434849046-19920-5-git-send-email-linux@rasmusvillemoes.dk>
Date: Mon, 22 Jun 2015 09:39:37 +0200
In-Reply-To: <1434849046-19920-5-git-send-email-linux@rasmusvillemoes.dk>
	(Rasmus Villemoes's message of "Sun, 21 Jun 2015 03:10:46 +0200")
Message-ID: <87mvzsp4xy.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 21 2015, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:

> +
> +my $old = read_stack_usage_file($ARGV[0]);
> +my $new = read_stack_usage_file($ARGV[1]);
> +my @common = grep {exists $new->{$_}} keys %$old;
> +print join(",", keys %old) . "\n";

Bah, that print is leftover from debugging. Please pretend it's not
there.

Rasmus
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
