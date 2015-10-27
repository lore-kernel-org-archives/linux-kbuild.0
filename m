Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.osadl.org ([62.245.132.105]:53389 "EHLO www.osadl.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964888AbbJ0PwT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 11:52:19 -0400
From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 0/4] Add generator notes to generated files
Date: Tue, 27 Oct 2015 16:30:38 +0100
Message-Id: <1445959842-1960-1-git-send-email-hofrat@osadl.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>

Generated files have a number of sources and it is not always easy to track
down where a file is generated. Simplify this by simply putting the
generator into the top of the file as comment.                                  

This set adds generator notes to:
include/generated/uapi/linux/version.h
include/generated/utsrelease.h
include/generated/compile.h
include/generated/autoconf.h
include/config/tristate.conf
include/config/auto.conf

thx!
hofrat
