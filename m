Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:52276 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934124Ab0EZG4N (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 May 2010 02:56:13 -0400
Date: Wed, 26 May 2010 07:56:11 +0100
From: Ben Dooks <ben-linux@fluff.org>
Subject: kbuild: menuconfig with O=<dir> creates empty include/config in
	base
Message-ID: <20100526065611.GD4720@trinity.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When doing "make O=test menuconfig" the base kernel directory picks up
a new empty directory include/config which stops further "make O=temp"
builds as the make system thinks the base directory is not clean.

I've had a look, but it is not easy to see where this is hapening.

So far only menuconfig seems to have triggered it, xconfig seems to work.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.

