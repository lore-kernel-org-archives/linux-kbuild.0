Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews08.kpnxchange.com ([213.75.39.13]:50658 "EHLO
	cpsmtpb-ews08.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753495AbaKDULO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 15:11:14 -0500
Message-ID: <1415131872.20372.200.camel@x220>
Subject: Re: [PATCH] xconfig: Search text should have focus after search and
 reopen
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 04 Nov 2014 21:11:12 +0100
In-Reply-To: <1415097323-20991-1-git-send-email-syntheticpp@gmx.net>
References: <1415097323-20991-1-git-send-email-syntheticpp@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter =?ISO-8859-1?Q?K=FCmmel?= <syntheticpp@gmx.net>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Tue, 2014-11-04 at 11:35 +0100, Peter Kümmel wrote:

Again, this patch, though smaller that the previous, is not obviously
trivial. So, could you please add a few lines describing current
behavior, why it's wrong, and how this patch fixes it? That might
increase the chance this patch gets some review.

> Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
> ---
>  scripts/kconfig/qconf.cc | 7 +++++++
>  scripts/kconfig/qconf.h  | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 9d3b04b..014df76c 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1198,6 +1198,7 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
>  	layout2->addWidget(editField);
>  	searchButton = new QPushButton(_("Search"), this);
>  	searchButton->setAutoDefault(FALSE);
> +	searchButton->setFocusPolicy(Qt::NoFocus);
>  	connect(searchButton, SIGNAL(clicked()), SLOT(search()));
>  	layout2->addWidget(searchButton);
>  	layout1->addLayout(layout2);
> @@ -1235,6 +1236,11 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
>  	}
>  }
>  
> +void ConfigSearchWindow::setFocusOnLineEdit()
> +{
> +	editField->setFocus(Qt::OtherFocusReason);
> +}
> +
>  void ConfigSearchWindow::saveSettings(void)
>  {
>  	if (name()) {
> @@ -1506,6 +1512,7 @@ void ConfigMainWindow::searchConfig(void)
>  	if (!searchWindow)
>  		searchWindow = new ConfigSearchWindow(this, "search");
>  	searchWindow->show();
> +	searchWindow->setFocusOnLineEdit();
>  }
>  
>  void ConfigMainWindow::changeMenu(struct menu *menu)
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index bde0c6b..6f2c4d6 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -288,6 +288,7 @@ public:
>  public slots:
>  	void saveSettings(void);
>  	void search(void);
> +	void setFocusOnLineEdit(void);
>  
>  protected:
>  	QLineEdit* editField;

Thanks,


Paul Bolle

