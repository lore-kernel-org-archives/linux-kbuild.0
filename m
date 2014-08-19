Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:55029 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707AbaHSWCc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 18:02:32 -0400
MIME-Version: 1.0
In-Reply-To: <1408474660-24999-2-git-send-email-beber@meleeweb.net>
References: <1408474660-24999-1-git-send-email-beber@meleeweb.net>
	<1408474660-24999-2-git-send-email-beber@meleeweb.net>
Date: Tue, 19 Aug 2014 15:02:31 -0700
Message-ID: <CA+r1ZhitXZXWWx6xsgiru8Z8PpMUqnrg=q4dKH4Sv4_wY9O13w@mail.gmail.com>
Subject: Re: [PATCH 1/3] modinst: wrap long lines in order to enhance cmd_modules_install
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bertrand Jacquin <beber@meleeweb.net>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Willy Tarreau <w@1wt.eu>

On Tue, Aug 19, 2014 at 11:57 AM, Bertrand Jacquin <beber@meleeweb.net> wrote:
> Note: shouldn't we use 'install -D $(2)/$@ $@' instead of mkdir
> and cp ?

Will an install with -D in that sense always be available?  That's not
a flag in the original (BSD) program, and I did find one SPARC system
-- admittedly an ancient one -- where the install program had a -D
option but it did something else.  install isn't listed as a required
program in Documentation/Changes, for that matter.
