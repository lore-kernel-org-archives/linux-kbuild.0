Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.174]:58401 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751272AbZFENbs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 09:31:48 -0400
Received: by wf-out-1314.google.com with SMTP id 26so667849wfd.4
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2009 06:31:50 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 5 Jun 2009 16:31:50 +0300
Message-ID: <55c333c0906050631y6ca1b676q94dd8ec324c9ba7@mail.gmail.com>
Subject: Building a 32 bit on a 64 bit machine.
From: Kevin Wilson <wkevils@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,
I want to build a module I developed for 32 bit on a 64 bit machine.
It is on a machine running Fedora.

I tried to install the kernel-devel of the 32 bit, and to build my module
agains that tree, with Make ARCH=i686. But I get error saying:
`-mcpu=' is deprecated. Use `-mtune=' or '-march=' instead.

error: CPU you selected does not support x86-64 instruction set

Any ideas? is it possible ?

I had success with building this module against other 64 bit kernels
using this method
(installing kernel-devel and building against it).

I appreciate if anybody can some link for some howto.

Rgs,
Kevin
