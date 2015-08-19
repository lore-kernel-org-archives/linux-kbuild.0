Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50707 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754080AbbHSPOx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Aug 2015 11:14:53 -0400
Subject: Re: [PATCH, resend] build: fix broken kernel RPM source symlink
References: <1435664842-17908-1-git-send-email-ec@numascale.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D49D6B.7050800@suse.cz>
Date: Wed, 19 Aug 2015 17:14:51 +0200
MIME-Version: 1.0
In-Reply-To: <1435664842-17908-1-git-send-email-ec@numascale.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Espen Carlsen <ec@numascale.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel J Blueman <daniel@numascale.com>, Steffen Persvold <sp@numascale.com>

On 2015-06-30 13:47, Espen Carlsen wrote:
> Fix the 'rpm-pkg' makefile target to always generate the correct
> /usr/src/kernel/<ver> symlink; this fails on non-RPM-native systems
> eg Ubuntu.
> 
> On a non-RPM-native system, the symlink created by rpmbuild points to
> the source tree, so the ln -sf commands to overwrite build and source will
> create a new link inside the directory pointed to by the build and source
> symlinks. This will break the -devel.rpm, as the build and source symlinks
> will point to non existing directories after installing them.

Which version of rpm do you have installed? $RPM_BUILD_ROOT should be
deleted and created empty by rpmbuild. If you have stale files in
$RPM_BUILD_ROOT, you will likely have bigger problem than this.

Michal
