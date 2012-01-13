Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.redfish-solutions.com ([66.232.79.143]:50139 "EHLO
	mail.redfish-solutions.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754127Ab2AMWlQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jan 2012 17:41:16 -0500
Received: from macbook.redfish-solutions.com (macbook.redfish-solutions.com [192.168.1.17])
	(authenticated bits=0)
	by mail.redfish-solutions.com (8.14.5/8.14.5) with ESMTP id q0DMLcnU019681
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Jan 2012 15:21:38 -0700
Message-ID: <4F10AE71.1060804@redfish-solutions.com>
Date: Fri, 13 Jan 2012 15:21:37 -0700
From: Philip Prindeville <philipp@redfish-solutions.com>
MIME-Version: 1.0
Subject: Parsing kconfig files from scripts
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I'm working on several projects that are linux based and use Kconfig.

One of the tasks on my list is to build automation that detects what targets to build nightly after continuous integrations into SCM (including new platforms being added).

A way to do this is to find in the Kconfig tree all possible values of a given symbol, such as CONFIG_CMDLINE for instance (ok, not a great example).

I was wondering if there was a command-line utility one could invoke to query the parse tree and dump values from it.

Thanks,

-Philip
