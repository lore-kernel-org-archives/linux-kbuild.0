Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38919 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756636Ab1EKV00 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 May 2011 17:26:26 -0400
Received: by iwn34 with SMTP id 34so870819iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 11 May 2011 14:26:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=JzPH6m2aCehfE=9WbJkUiqzZgWQ@mail.gmail.com>
References: <1305064543-7401-1-git-send-email-jim.cromie@gmail.com>
	<alpine.LNX.2.00.1105111126580.28291@pobox.suse.cz>
	<BANLkTi=JzPH6m2aCehfE=9WbJkUiqzZgWQ@mail.gmail.com>
Date: Wed, 11 May 2011 17:26:25 -0400
Message-ID: <BANLkTi=OfD7W7u7+ujRGjAbR3mYFaNwwMw@mail.gmail.com>
Subject: Re: [PATCH] fix unterminated sed cmd in export_report.pl
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Jim Cromie <jim.cromie@gmail.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi

On Wed, May 11, 2011 at 5:16 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> -     = `cat .tmp_versions/*.mod | grep '.*\.ko\$' | sed s/\.ko$/.mod.c/`;
> +     = `sed '/\.ko$/!d; s/\.ko$/.mod.c/' .tmp_versions/*.mod`;
>
Actually, my perl-fuu is not what it used to be, that one should be better:

+     = `sed '/\\.ko\$/!d; s/\\.ko\$/.mod.c/' .tmp_versions/*.mod`;

The backslash before the '.' should be escaped as well to be passed to
sed(1). I'll give it a try to confirm.

 - Arnaud
