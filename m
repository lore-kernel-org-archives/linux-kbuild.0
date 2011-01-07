Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:63802 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751808Ab1AGWcj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 Jan 2011 17:32:39 -0500
Received: by qwa26 with SMTP id 26so18288182qwa.19
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Jan 2011 14:32:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110107150221.GD1841@sepie.suse.cz>
References: <1294328565-2750-1-git-send-email-jacmet@sunsite.dk>
	<20110107150221.GD1841@sepie.suse.cz>
Date: Fri, 7 Jan 2011 23:32:36 +0100
Message-ID: <AANLkTikZEG+crVGuY7N-UbpeZTsOMf62t8xSUi5K3BoT@mail.gmail.com>
Subject: Re: [PATCH] nconf: handle comment entries within choice/endchoice
From: Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: nir.tzachar@gmail.com, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On Fri, Jan 7, 2011 at 4:02 PM, Michal Marek <mmarek@suse.cz> wrote:

> OK, applied, but is this actually used somewhere?

Afaik nowhere in the kernel, but we do use it in Buildroot (which uses
kconfig like several other projects).

-- 
Bye, Peter Korsgaard
