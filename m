Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail011.snc4.facebook.com ([66.220.144.143]:40071 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752403Ab1ECWeg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 May 2011 18:34:36 -0400
Date: Tue, 3 May 2011 15:34:35 -0700
From: Arun Sharma <asharma@fb.com>
Subject: Re: [PATCH] Make it possible to override INSTALL_HDR_PATH
Message-ID: <20110503223435.GA14389@dev1756.snc6.facebook.com>
References: <20110503214612.GA26479@dev1756.snc6.facebook.com>
 <201105040000.29351.yann.morin.1998@anciens.enib.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201105040000.29351.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org, Arun Sharma <asharma@fb.com>

On Wed, May 04, 2011 at 12:00:29AM +0200, Yann E. MORIN wrote:
>   $ make INSTALL_HDR_PATH=$(pwd)/FOO ARCH=x86 headers_install
>   $ ls -l FOO

Works for me too :) I was trying:

echo 'INSTALL_HDR_PATH=$RPM_BUILD_ROOT/usr make %{?_smp_mflags} headers_install'

along the lines of:

scripts/packaging/mkspec:

echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC=modules_install'

While we're on the topic, could we enhance mkspec to spit out -devel and
-headers rpms too? I can post patches if there is sufficient interest.

It'd be nice to use the same mechanism to define/override:

INSTALL_PATH
INSTALL_MOD_PATH
INSTALL_HDR_PATH

 -Arun
