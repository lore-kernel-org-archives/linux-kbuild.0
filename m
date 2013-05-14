Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:43802 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929Ab3ENEwl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 May 2013 00:52:41 -0400
Message-ID: <5191C313.1010105@zytor.com>
Date: Mon, 13 May 2013 21:52:35 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Subdirectory output dependencies
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

What is the proper way to indicate to Kbuild that something in the
current directory depends on something built in a subdirectory?

Specifically, something like:

obj-y += foo/
obj-y += bar.o

... where bar.o depends on a header file generated inside the foo directory?

	-hpa
